require "sinatra/base"
require "sanitize"

class WebApp < Sinatra::Application
  helpers do
    def sanitize(html)
      Sanitize.fragment(html, Sanitize::Config::RESTRICTED)
    end
  end

  get "/" do
    @source = params["source"]

    if @source
      out = StringIO.new
      ::Nkn.run(@source, out: out)
      @result = out.string
    end

    erb :index
  end
end
