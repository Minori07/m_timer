class TasksController < ApplicationController
before_action :authenticate_user!
def index
  @tasks = current_user.tasks
end

def show
  @task = target_task params[:id]
end

def new
  @task = Task.new
end

def create
  @task = current_user.tasks.new task_params
  @task.save!
  redirect_to week_list_path(@task.week)
end

def edit
  @task = target_task params[:id]
end

def update
  @task = target_task params[:id]
  @task.update(task_params)
  redirect_to week_list_path(@task.week)
end

def destroy
  @task = target_task params[:id]
  @task.destroy
  redirect_to week_list_path(@task.week)
end


def week
end

def alarm
  @time = Time.zone.now
  @tasks = current_user.tasks.where(week: Time.use_zone('Asia/Tokyo') { Time.zone.now }.wday).order("time")
end

def cfg
end

def day
  require 'nokogiri'
    require 'open-uri'
 
    url = 'https://weather.yahoo.co.jp/weather/jp/23/5110.html'
 
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
 
    # ノコギリを使ってhtmlを解析
    doc = Nokogiri::HTML.parse(html, charset)
    
        
    #weather forecast
    @weatherforecast = doc.search( 'div.forecastCity>table> tr> td> div>p.pict>img' )[0].attribute("alt").value 
    
    #weather image
    # @weatherimage = doc.search( 'div.forecastCity>table> tr> td> div>p.pict>img' )[0].attribute("src").value
    @weatherimage = "weather/" + @weatherforecast + ".png"

    #high temp
    str =  doc.search( 'div.forecastCity>table> tr> td> div>ul.temp>li.high' ).inner_text
    pos = str.index("]") 
    len = pos + 1
    newStr = str[0, len]
    @hightemp = newStr + "↑"

    #low temp
    str =  doc.search( 'div.forecastCity>table> tr> td> div>ul.temp>li.low' ).inner_text
    pos = str.index("]") 
    len = pos + 1
    newStr = str[0, len]      
    @lowtemp = newStr + "↓"
    
    #precip1
    str =  doc.search( 'div.forecastCity>table> tr> td> div>table>tr.precip>td' )
    str1 =  str.inner_text
    @str1 = str1
    
    @precip1 =  str[0].inner_text
    @precip2 =  str[1].inner_text    
    @precip3 =  str[2].inner_text
    @precip4 =  str[3].inner_text

    str = doc.xpath('//dd[@class="heatExpo_info"]').inner_text.split(" ")
    @heat_image = "heat/" + str[0] + ".png"
    @heat_main = str[0]
    @heat_sub = str[1]

    @memos = current_user.memos

end

def list
  @tasks = target_week params[:week]
  @week = params[:week]

  if params[:taskId]
    @task = target_task params[:taskId]
  else
    @task = Task.new
  end
end

private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def target_week task_week
    @time = Time.zone.now
    current_user.tasks.where(week: task_week).order("@time")
  end

  def task_params
    params.require(:task).permit(:title, :week, :time)
  end
end
