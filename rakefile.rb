require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['spec/lib/**/*_spec.rb']
  t.verbose = false
  t.warning = true
end

namespace :build do
  desc "Build checksums of all gems in pkg directory"
  task :checksum do
    require 'digest/sha2'
    Dir.mkdir('checksum') unless Dir.exist?('checksum')
    Dir.glob('*.gem', base: 'pkg').each do |gem|
      checksum = Digest::SHA512.new.hexdigest(File.read("pkg/#{gem}"))
      File.open("checksum/#{gem}.sha512", 'w') { |f| f.write(checksum) }
    end
  end
end

task default: :test
