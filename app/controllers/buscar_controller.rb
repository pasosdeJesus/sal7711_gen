require 'tiny_tds'

class BuscarController < ApplicationController
	def index
		#byebug
		#client = TinyTds::Client.new(:username => 'hsi', :password => 'wstinol', :host => '192.168.1.4')
		client = TinyTds::Client.new(:username => 'hsi', :password => 'wstinol', :host => '192.168.10.2')
		#client = TinyTds::Client.new(:username => 'hsi', :password => 'wstinol', :host => '127.0.0.1')

		if client.dead?
			puts "dead"
		end
		if client.active?
			puts "active"
		end
		w = ""
		if (params[:fechaini] && params[:fechaini] != '')
			pfi = client.escape(params[:fechaini])
			w = " AND keyvaluedate>='#{pfi}'"
		end
		if(params[:fechafin] && params[:fechafin] != '')
			pff = client.escape(params[:fechafin])
		 	w += " AND keyvaluedate<='#{pff}'"
		end

		r = client.execute("USE OnBase").do;
		f = "FROM hsi.keyitem103, hsi.itemdata 
		WHERE keyitem103.itemnum=itemdata.itemnum #{w}"
		c = "SELECT count(*) AS cuenta #{f}"
		cuentar = client.execute(c)
		@numregistros = cuentar.first["cuenta"]
		c = "SELECT itemdata.itemname #{f}"
		puts "OJO q=#{c}"
		@enctabla = ["Artículos"]
		@coltotales = []
	  if (!params[:fechaini] || params[:fechaini] == '' || 
				!params[:fechafin] || params[:fechafin] == '')
			@cuerpotabla = []
		else
			puts params
			result = client.execute(c)
			puts result
			#result.each do |row|
			#	puts row
			#end
			@cuerpotabla = result
		end

		respond_to do |format|
			format.html { }
			format.json { head :no_content }
			format.js   { render 'resultados' }
		end

	end

	def resultados
	end

	def detalle
	end
end
