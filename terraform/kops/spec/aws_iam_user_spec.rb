require 'rspec'
require 'spec_helper'

describe iam_user('kubey') do

  it { should exist }
  it { should have_role}
end