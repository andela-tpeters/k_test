module ResponseHelper
  def respond(partial, locals)
    respond_to do |format|
      format.html {
        render partial: partial, locals: locals
      }
    end
  end

  def respond(path)
    respond_to do |format|
      format.html { 
        redirect_to path
      }
    end
  end
end
