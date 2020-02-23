# frozen_string_literal: true

require 'mysql2'

module MySQL
  CLIENT = Mysql2::Client.new(
    host: 'us-cdbr-iron-east-04.cleardb.net',
    username: ENV['DB_USER'],
    password: ENV['DB_PW'],
    database: 'heroku_25c4d277aedb8c2'
  )

  def self.entry_exists?(table, url)
    result = CLIENT.query("SELECT url FROM #{table} WHERE url LIKE '%#{url}%'")
    result.count.positive?
  end

  def self.add_entry(table, url, text)
    description = CLIENT.escape(text)
    CLIENT.query("INSERT INTO #{table} (created_at, url, text)
    VALUES (CURRENT_TIMESTAMP(), '#{url}', '#{description}')")
  end
end
