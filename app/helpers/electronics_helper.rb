module ElectronicsHelper

  def all_electronics
    @electronics = Electronic.paginate(page: params[:page])
  end
end
