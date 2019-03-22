class PagesController < ApplicationController

  def hello 
  end

  def webdesign
    @page_title = "Web Design Certificate"
  end

  def android
    @page_title = "Android App Development Certificate"
  end

  def laravel
    @page_title = "Laravel Course Certificate"
  end

  def graphics
    @page_title = "Graphics Design Diploma"
  end

  def nodecourse
    @page_title = "Node Course Certificate"
  end

  def diploma
    @page_title = "Professional Diploma in Web and Android Systems"
  end

  def hnd
    @page_title = "HND in Software Engineering"
  end

  def bscmobile
    @page_title = "BSc in Mobile Computing"
  end

  def bscweb
    @page_title = "Bsc in Web and Mobile Systems"
  end
  
  def rail
    @page_title = "Ruby on Rails Certificate"
  end 

  def bscsoftware
    @page_title = "Bsc in Software Engineering"
  end

  def bsccsna
    @page_title = "Bsc computer systems and Network Administration"
  end
  
end