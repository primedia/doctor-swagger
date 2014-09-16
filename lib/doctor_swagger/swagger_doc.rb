module DoctorSwagger
  class SwaggerDoc

    def initialize(resource_path, options = {}, &block)
      @resource_path   = resource_path
      options[:swagger_version] ||= DoctorSwagger.swagger_version
      options[:api_version]     ||= DoctorSwagger.api_version
      options[:base_path]       ||= DoctorSwagger.base_path
      @swagger_version = options[:swagger_version]
      @api_version     = options[:api_version]
      @base_path       = options[:base_path]
      @endpoints       = []
      @models          = {}
      instance_eval(&block)
    end

    def endpoint(path, &block)
      @endpoints << Endpoint.new(path, &block)
    end

    def models(hash)
      raise "models must be a hash" if !hash.is_a?(Hash)
      @models = hash
    end

    #TODO: add DSL for 
    def as_json(*)
      json = {
        'apiVersion'     => try_call(@api_version),
        'swaggerVersion' => try_call(@swagger_version),
        'basePath'       => try_call(@base_path),
        'resourcePath'   => @resource_path,
        'apis'           => @endpoints.map(&:as_json)
      }

      unless @models.nil? or @models == {}
        json.merge!({
          'models'         => @models
        })
      end

      json
    end

    private

    def try_call(value)
      value.respond_to?(:call) ? value.call : value
    end
  end
end
