require 'rspec'
require 'spec_helper'

describe iam_user('kopsy') do

  it { should exist }
  it { should belong_to_iam_group('kops_bootstrap') }

end

describe iam_group('kops_bootstrap') do

  it { should exist }
  it { should be_allowed_action('route53:*') }
  it { should be_allowed_action('s3:*') }
  it { should be_allowed_action('ec2:*') }
  it { should be_allowed_action('iam:*') }
end

