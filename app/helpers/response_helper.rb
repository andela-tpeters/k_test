module ResponseHelper
  def respond_partial(partial, locals)
    respond_to do |format|
      format.html { render partial: partial, locals: locals }
    end
  end

  def respond_message(status, message)
    locals = {status: status, message: message}
    respond_to do |format|
      format.html { render partial: 'application/message', locals: locals }
    end
  end

  def respond(path)
    respond_to do |format|
      format.html { redirect_to path }
    end
  end
end
