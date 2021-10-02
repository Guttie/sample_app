class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを新規作成するためのインスタンス作成
    list = List.new(list_params)
    #データをDBに保存するためのsaveメソッド実行
    list.save
    #詳細画面へのリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  def index
    @lists = List.all
    
  end
  
  def show
    @list = List.find(params[:id])
    
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
