namespace :db do
  desc 'Launch database shell'
  task :shell => :environment do
    config = ActiveRecord::Base.configurations[RAILS_ENV || 'development']
    command = ''
    
    case config['adapter']
    when 'mysql'
      command << 'mysql '
      command << "--host=#{config['host'] || 'localhost'} "
      command << "--port=#{config['port'] || 3306} "
      command << "--user=#{config['username'] || 'root'} "
      command << "--password=#{config['password'] || ''} "
      command << config['database']
    when 'postgresql'
      command << 'psql '
      command << "-h #{config['host'] || 'localhost'} "
      command << "-p #{config['port'] || 5432} "
      command << "-U #{config['username'] || 'postgres'} "
      command << config['database']
    else
      command << "echo Unsupported databse adapter: #{config['adapter']}"
    end
    
    system command
  end
end
