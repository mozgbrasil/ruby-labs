#

ruby_version = RUBY_VERSION

puts "Hello World! (ruby #{ruby_version})\n";

#

# https://stackoverflow.com/questions/7190015/how-do-i-get-a-list-of-files-that-have-been-required-in-ruby

# alias :orig_require :require
# def require s
#   print "Requires #{s}\n" if orig_require(s)
# end

# https://repl.it/repls/ItchyOrangeredCodewarrior#main.rb

# ruby shell.rb
# ruby -I . -r "shell" -e "Shell.new.test_loops_iterators" arg1 arg2
# ruby -I . -r "shell" -e "Shell.new.test_postgress"
# ruby -I . -r "shell" -e "Shell.new.test_s3"

require 'pg'
require 'uri'
require 'aws-sdk'
require 'json'

class Shell
  def test_loops_iterators
    puts ARGV
    puts 'https://launchschool.com/books/ruby/read/loops_iterators'

    i = 0
    loop do
      i += 2
      puts i
      if i == 10
        break # this will cause execution to exit the loop
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def test_postgress
    arr_master = []
    # Connect to database.
    # database_url = ENV['DATABASE_URL']
    database_url = ENV['DATABASE_URL']
    # database_url = 'postgresql://admanager:admanager@postgress:5432/admanager'
    uri = URI.parse(database_url)

    arr_master.push("database_url: #{database_url}")
    arr_master.push("uri: #{uri}")
    arr_master.push("uri: #{uri.inspect}")

    pg_host = uri.hostname
    pg_db = uri.path[1..-1]
    pg_user = uri.user
    pg_pass = uri.password
    pg_port = uri.port
    pg_options = nil
    pg_tty = nil

    arr_master.push("pg_host: #{pg_host} / pg_port: #{pg_port}")
    arr_master.push("pg_db: #{pg_db}")
    arr_master.push("pg_user: #{pg_user}")
    arr_master.push("pg_pass: #{pg_pass}")

    conn = PG.connect(pg_host, pg_port, pg_options, pg_tty, pg_db, pg_user, pg_pass)

    arr_master.push("conn: #{conn}")

    arr_tables = []

    # List all tables.
    tables = conn.exec("
        SELECT * FROM pg_catalog.pg_tables
        WHERE schemaname != 'pg_catalog' AND
        schemaname != 'information_schema';
        ")
    tables.num_tuples.times do |i|
      p tables[i]
      arr_tables.push(tables[i])
    end

    arr_master.push(arr_tables)

    arr_master
  end
  # rubocop:enable Metrics/MethodLength

  def test_s3
    # current_time = DateTime.now
    # current_time = current_time.strftime('%y%m%d-%H%M%S')

    # puts "current_time: #{current_time}"

    # exit

    puts 'https://docs.aws.amazon.com/pt_br/sdk-for-ruby/v3/developer-guide/s3-example-create-buckets.html'

    # profile_name = 'david'
    region = ENV['AMAZON_REGION']
    access_key_id = ENV['AMAZON_ACCESS_KEY_ID']
    secret_access_key = ENV['AMAZON_SECRET_ACCESS_KEY']

    # S3

    # Configure SDK
    # s3 = Aws::S3::Client.new(profile: profile_name, region: region)
    s3 = Aws::S3::Client.new(
      region: region,
      access_key_id: access_key_id,
      secret_access_key: secret_access_key
    )

    puts "s3: #{s3}"

    # Display a List of Amazon S3 Buckets
    # resp = s3.list_buckets
    # resp.buckets.each do |bucket|
    #   puts bucket.name
    # end

    #

    bucket_name = ENV['AMAZON_BUCKET_NAME']

    # Upload a file to s3 bucket, using put_object

    # file_path = 'files/test_s3_put_object.txt'

    # response = s3.put_object(bucket: bucket_name, key: file_path, body: 'My first s3 object')

    # puts "response: #{response}"

    puts 'https://docs.aws.amazon.com/AmazonS3/latest/dev/UploadObjSingleOpRuby.html'

    s3 = Aws::S3::Resource.new(
      region: region,
      access_key_id: access_key_id,
      secret_access_key: secret_access_key
    )

    puts "s3: #{s3}"

    file = 'log/staging.log'
    file_path = 'files/test_s3_upload_file.txt'

    resource = s3.bucket(bucket_name).object(file_path)
    filename = file_path.gsub(%r{.*\/}, '')
    metadata = { content_disposition: "attachment; filename=#{filename}" }
    response = resource.upload_file(file, metadata)

    puts "response: #{response}"
  end
end

shell = Shell.new
response = shell.test_loops_iterators
puts "response: #{response}"
