require "sinatra/base"

class WebApp < Sinatra::Application
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
