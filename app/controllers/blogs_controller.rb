class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all#authorization all user admin

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.special_blogs
    @page_title = "My Blog"#Dynamic title
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title# Dynamic title/show blogs
    @seo_keywords = @blog.body#keywords tekst bloga
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def toggle_status

    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
      
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])#ranije je trazio broj tj. id. Friendly trazi params ali mapuje slug za id i nalazi ga.
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
