class ContentsController < RankingController
  before_action :authenticate_user!, only: :search
  impressionist actions: [:show]

  def index
    @eyecatchs = Content.where('eyecatch_content = true').limit(2)
    @recommended = Content.where('is_recommened = true').limit(5)
    @contents = Content.order('id ASC').page(params[:page]).per(15)
    @tags = Content.tag_counts_on(:tags).order('count DESC').limit(16)
  end

  def show
    @content = Content.find(params[:id])
    @eyecatchs = Content.where('eyecatch_content = true').limit(2)
    @recommended = Content.where('is_recommened = true').limit(5)
  end

  def new
    @content = Content.new
  end

  def search
    @search_contents_count = Content.where('title LIKE(?)', "%#{params[:keyword]}%")
    @search_contents = @search_contents_count.order("created_at DESC").page(params[:page]).per(10)
    @recommended = Content.where('is_recommened = true').limit(5)
    @tags = Content.tag_counts_on(:tags).order('count DESC')
  end

  def create
    Content.create(create_params)
    redirect_to controller: :contents, action: :index
  end


  private
  def create_params
    params.require(:content).permit(:title, :text, :image_urls, :tag, :name, :tag_list)
  end
end
#
# def search
#     if (params[:departure]=="指定しない") && (params[:arrival]=="指定しない") then
#       @products_count = Product.where(['title LIKE? or destination LIKE? or departure LIKE? or arrival LIKE? or detail LIKE?' , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
#       @products = @products_count.order("created_at DESC").page(params[:page]).per(10)
#     elsif (params[:departure]!="指定しない") && (params[:arrival]=="指定しない") then
#       search_products = Product.where(departure: params[:departure])
#       @products_count = search_products.where(['title LIKE? or destination LIKE? or departure LIKE? or arrival LIKE? or detail LIKE?' , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
#       @products = @products_count.order("created_at DESC").page(params[:page]).per(10)
#     elsif (params[:departure]=="指定しない") && (params[:arrival]!="指定しない") then
#       search_products = Product.where(arrival: params[:arrival])
#       @products_count = search_products.where(['title LIKE? or destination LIKE? or departure LIKE? or arrival LIKE? or detail LIKE?' , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
#       @products = @products_count.order("created_at DESC").page(params[:page]).per(10)
#     else
#       search_products = Product.where(departure: params[:departure], arrival: params[:arrival])
#       @products_count = search_products.where(['title LIKE? or destination LIKE? or departure LIKE? or arrival LIKE? or detail LIKE?' , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
#       @products = @products_count.order("created_at DESC").page(params[:page]).per(10)
#     end
#   end
