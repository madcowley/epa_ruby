# adapted from https://github.com/GSA-OCSIT/epa_uv_index
module EPA
  class Client
    class UvIndex
      HOURLY_BASE_URL = "http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVHOURLY"
      DAILY_BASE_URL = "http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVDAILY"
      HOURLY_BASE_PATH = "getEnvirofactsUVHOURLY"
      DAILY_BASE_PATH = "getEnvirofactsUVDAILY"
      
      def self.hourly_for(params)
        begin
          do_request(HOURLY_BASE_PATH, params).get_envirofacts_uvhourly_list.get_envirofacts_uvhourly
        rescue Exception => e
          raise e
        end
      end
    
      def self.daily_for(params)
        begin
          do_request(DAILY_BASE_PATH, params).get_envirofacts_uvdaily_list.get_envirofacts_uvdaily
        rescue Exception => e
          raise e
        end
      end
    
      protected
    
      def self.do_request(base_url, params)
        raise "Please provide either a city/state or a zip code." unless params[:zip] or (params[:city] and params[:state])
        request_url = build_request_url(base_url, params)
        EPA.get(request_url, {})
      end
    
      def self.build_request_url(base_url, params)
        if params[:zip]
          "#{base_url}/ZIP/#{params[:zip]}"
        else
          "#{base_url}/CITY/#{params[:city]}/STATE/#{params[:state]}"
        end
      end
    
    end
  end
end