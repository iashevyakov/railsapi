require 'ncurses'
require './news_fetcher'

begin
  scr = Ncurses.initscr
  Ncurses.cbreak()
  Ncurses.noecho()
  Ncurses.keypad(scr, true)

  fields = Array.new
  fields.push(Ncurses::Form.new_field(1,20,10,38,0,0))
  Ncurses::Form.set_field_back(fields[0], Ncurses::A_UNDERLINE)
  Ncurses::Form.field_opts_off(fields[0], Ncurses::Form::O_AUTOSKIP)
  form = Ncurses::Form.new_form(fields)

  Ncurses::Form.post_form(form)
  scr.refresh()

  Ncurses.mvprintw(10, 20, "Enter a keyword : ")
  scr.refresh()
  scr.scrollok(true)

  search = ''

  URL = 'https://data-storage-shevyakov.herokuapp.com/news_rest/'

  news_fetcher = NewsFetcher.new(URL)

  def print_text(win, news)
    if news.empty?
      win.addstr("No found news")
    else
      news.each do |news_item|
        win.addstr("\nTitle\n")
        win.addstr("--------\n")
        win.addstr(news_item["title"])
        win.addstr("\n\nDescription\n")
        win.addstr("--------\n")
        win.addstr(news_item["description"])
        win.addstr("\n\n***************************\n")
      end
    end
  end

  #27 - Esc
  while((ch = scr.getch()) != 27) do
    case(ch)

    when Ncurses::KEY_BACKSPACE
      Ncurses::Form.unpost_form(form)
      Ncurses::Form.post_form(form)
      Ncurses.mvprintw(10, 20, "Enter a keyword : ")
      search = search[0..-2]
      search.each_char {|c| Ncurses::Form.form_driver(form, c.ord)}
      scr.refresh()

    when 10
      Ncurses::Form.unpost_form(form)
      scr.refresh()
      news_fetcher.set_keyword(search)
      news = news_fetcher.get_news()
      print_text(scr, news)
      while((ch = scr.getch()) != Ncurses::KEY_BACKSPACE) do
      end
      search=''
      scr.clear()
      Ncurses::Form.post_form(form)
      Ncurses.mvprintw(10, 20, "Enter a keyword : ")
      scr.refresh()
    else                                                                   
      Ncurses::Form.form_driver(form, ch)
      begin
        search = search + ch.chr
      rescue
      end
    end
  end




ensure
  Ncurses.echo()
  Ncurses.nocbreak()
  Ncurses.nl()
  Ncurses.endwin()
end
