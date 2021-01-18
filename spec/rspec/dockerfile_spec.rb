# frozen_string_literal: true

require 'serverspec'
require 'docker-api'

describe 'Dockerfile' do
  image = Docker::Image.build_from_dir('.')
  set :os, family: :alpine
  set :backend, :docker
  set :docker_image, image.id

  describe file('/docker-lib.sh') do
    it { should exist }
  end

  describe package('ruby-dev') do
    it { should be_installed }
  end
end
