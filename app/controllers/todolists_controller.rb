class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを新規作成するためのインスタンス作成
    list = List.new(list_params)
    #データをDBに保存するためのsaveメソッド実行
    list.save
    #トップ画面へのリダイレクト
    redirect_to '/top'
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
