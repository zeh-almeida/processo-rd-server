# config/initializers/rack_attack.rb
class Rack::Attack

  # Known attach addresses
  errors = [ "apptagi", "asp", "aspx", "cfide", "cgi-bin", "clientaccesspolicy.xml", "hnap1", "home.asp", "index.php",
             "jsp", "maios.html", "myadmin", "password.cgi", "php", "phpmyadmin", "pma", "server-status", "test",
             "testproxy.php", "vb", "w00tw00t", "webdav", "wordpress", "wp", "wp-admin", "wp-login", "xmlrpc.php", "zecmd"]

  ### Prevent Brute-Force Login Attacks ###

  # The most common brute-force login attack is a brute-force password
  # attack where an attacker simply tries a large number of emails and
  # passwords to see if any credentials match.
  #
  # Another common method of attack is to use a swarm of computers with
  # different IPs to try brute-forcing a password for a specific account.

  # Throttle POST requests to /login by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.ip
    end
  end

  # Block suspicious requests for '/etc/password' or wordpress specific paths.
  # After 3 blocked requests in 10 minutes, block all requests from that IP for 5 minutes.
  Rack::Attack.blacklist('fail2ban pentesters') do |req|
    # `filter` returns truthy value if request fails, or if it's from a previously banned IP
    # so the request is blocked
    Rack::Attack::Fail2Ban.filter("pentesters-#{req.ip}", maxretry: 3, findtime: 10.minutes, bantime: 1.hour) do
      # The count for the IP is incremented if the return value is truthy
      query = req.path
      result = query =~ %r{/etc/passwd} || query.include?( "/etc/passwd" )

      unless result
        url_parts  = query.downcase.split("/").reject!(&:blank?)
        if url_parts.blank?
          result = false

        else
          url_parts.each do |part|
            result = errors.include?(part)
            break if result
          end

          unless result
            file_parts = url_parts.last.split(".")
            if file_parts.blank?
              result = false

            else
              result = case file_parts.last
              when *errors
                true

              else
                false
              end
            end
          end
        end
      end

      result
    end
  end
end
