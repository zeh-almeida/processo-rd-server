class EnablePgExtensions < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    enable_extension 'citext'
    enable_extension 'uuid-ossp'
    enable_extension 'unaccent'
  end
end
