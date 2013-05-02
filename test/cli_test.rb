require "test_helper"
require "popme/cli"
require "popme/storage"

describe Popme::CLI do

  HELP_MESSAGE = ["################# PopMe Help #################

pop list                view a list of all your key-sites
pop <key>               open the <value> for the selected <key> on browser
pop add <key> <value>   add a <key> => <value> pair to your list
pop rm <key>            removes <key> => <value> from list given key exists
pop                     view this menu
all other documentation is located at:
 https://github.com/eavgerinos/popme

", ""]
       
  LIST_MESSAGE = ["google => http://google.com
youtube => http://youtube.com
github => https://github.com
popme => http://rubygems.org/gems/popme
twitter => http://twitter.com
local => http://localhost:3000
tomdoc => http://tomdoc.org/
facebook => http://facebook.com
", ""]

  before do
    @cli = Popme::CLI.new
  end

  it "should print the correct help message" do
    out = capture_io do
      @cli.help
    end
    out.must_equal HELP_MESSAGE
  end

  it "should print the correct list message" do
    out = capture_io do
      @cli.list
    end
    out.must_equal LIST_MESSAGE
  end

end