require 'spec_helper'
require 'doctor-swagger'

describe DoctorSwagger do
  module DoctorSwaggerRootTest
    include DoctorSwagger

    swagger_version 'some crazy version'
    api_version '3.0'
    base_path       'https://example.com/api'
    resource_path '/'


    swagger_root_resource '' do
      endpoint '/products' do
        description 'Products'
      end

      endpoint '/products/{product_id}' do
        description 'Show product'
      end
    end
  end

  subject { DoctorSwaggerRootTest.swagger_doc }

  before(:each) do
    @actual = DoctorSwaggerRootTest.swagger_doc
  end

  its(:as_json) do
    should == {
      'apiVersion' => '3.0',
      'swaggerVersion' => 'some crazy version',
      'basePath' => "https://example.com/api",
      'resourcePath' => '/',
      'apis' => [
        {
          'path' => '/products',
          'description' => 'Products'
        },
        {
          'path' => '/products/{product_id}',
          'description' => 'Show product',
        }
      ]
    }
  end
end
