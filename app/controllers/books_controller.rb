class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy, :delete_author, :add_author, :history]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    @@temp_book_authors_list ||= {}
    @author_book_rels = @book.author_book_rels.select("*, MAX(version_no)").group(:author_id)
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @book.author_book_rels.last
      current_version = @book.author_book_rels.last.version_no
    else
      current_version = 0
    end
    AuthorBookRel.transaction do
      @@temp_book_authors_list.each do |key, value|
        AuthorBookRel.create(book_id: value[:book_id],
                             author_id: value[:author_id],
                             delete_flag: value[:delete_flag],
                             version_no: (current_version + 1))
      end
    end
    @@temp_book_authors_list = {}

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to edit_book_path(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_author
    if @book.author_book_rels.last
      current_version = @book.author_book_rels.last.version_no
    else
      current_version = 0
    end

    author_book_rel = @book.author_book_rels.find(params[:author_book_rel_id])

    new_author_book_rel = author_book_rel.dup
    new_author_book_rel.delete_flag = true
    new_author_book_rel.version_no = current_version + 1
    new_author_book_rel.save
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Author related to the book was successfully deleted.' }
    end
  end

  def add_author
    author = params[:book][:id]
    @@temp_book_authors_list[author]= { book_id: @book.id, author_id: author, delete_flag: false }
    respond_to do |format|
      format.html { redirect_to edit_book_path(@book), notice: 'Author was add to the book successfully.' }
    end
  end

  def history
    version_no = params[:version_no]
    @author_book_rels = @book.author_book_rels.where("version_no <= ?", version_no).order("version_no DESC")
    @author_book_rels = @author_book_rels.select("*, MAX(version_no)").group(:author_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :book, :version_no)
    end
end
