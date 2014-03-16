# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

require "awesome_print_motion"
require 'teacup'
require 'motion-layout'
require 'bubble-wrap'
require 'motion-stump'


Motion::Project::App.setup do |app|

  # Use `rake config' to see complete project settings.
  app.name = 'moodios-rubymotion'
  app.identifier = "au.com.dius.moodios"
  case ENV['DEPLOY']
    when 'apple'
      puts 'apple provisioning'
      app.provisioning_profile = './profiles/???.mobileprovision'
      app.codesign_certificate = 'iPhone Distribution: DiUS Computing Pty Ltd (HR4LVL7TKY)'
    when 'testflight'
      puts 'testflight provisioning'
      app.provisioning_profile = './profiles/Moodios_Ad_Hoc.mobileprovision'
      app.codesign_certificate = 'iPhone Distribution: DiUS Computing Pty Ltd (HR4LVL7TKY)'
    else
      puts 'development provisioning'
      app.provisioning_profile = './profiles/Moodios_Development_Profile.mobileprovision'
      app.codesign_certificate = 'iPhone Developer: Andrew Spinks (QAYKE3H3WC)'
  end

end
