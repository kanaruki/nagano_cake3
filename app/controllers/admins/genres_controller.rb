class Admins::GenresController < ApplicationController
  def index
    @genreall = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save(genre_params)
      redirect_to admins_genres_path
    else
      @genreall = Genre.all
      render:index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       redirect_to admins_genres_path
    else
      render:edit
    end
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  
end
