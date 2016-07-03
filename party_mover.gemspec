# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "party_mover"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Yauheni Sushkevich"]
  s.email       = ["yauhenisushkevich@gmail.com"]
  s.homepage    = "https://github.com/yauhenininjia/party_mover"
  s.summary     = %q{Move uploaded by CarrierWave content from one server to another.}
  s.description = %q{This gem can move your content from one server to another}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
