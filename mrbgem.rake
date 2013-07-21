MRuby::Gem::Specification.new('mruby-fluent-logger') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Kentaro Yoshida'
  spec.version = '0.0.1'
  spec.homepage = 'https://github.com/y-ken/fluent-logger-mruby/'

  # The dependency system is currently (May 2013) under development.
  #spec.add_dependency('mruby-io')  
  #spec.add_dependency('mruby-socket')
  #spec.add_dependency('mruby-pack')
  #spec.add_dependency('mruby-json')
  #spec.add_dependency('mruby-http')
  #spec.add_dependency('mruby-simplehttp-socket')
  #spec.add_dependency('mruby-httprequest')

  # Add compile flags
  # spec.cc.flags << ''

  # Add cflags to all
  # spec.mruby.cc.flags << '-g'

  # Add libraries
  # spec.linker.libraries << 'external_lib'

  # Default build files
  # spec.rbfiles = Dir.glob("#{dir}/mrblib/*.rb")
  # spec.objs = Dir.glob("#{dir}/src/*.{c,cpp,m,asm,S}").map { |f| objfile(f.relative_path_from(dir).pathmap("#{build_dir}/%X")) }
  # spec.test_rbfiles = Dir.glob("#{dir}/test/*.rb")
  # spec.test_objs = Dir.glob("#{dir}/test/*.{c,cpp,m,asm,S}").map { |f| objfile(f.relative_path_from(dir).pathmap("#{build_dir}/%X")) }
  # spec.test_preload = 'test/assert.rb'

  # Values accessible as TEST_ARGS inside test scripts
  # spec.test_args = {'tmp_dir' => Dir::tmpdir}
end
