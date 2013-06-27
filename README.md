

						###########################
						######### Readme ##########
						###########################

### How to use this programme ###

It is not neccesary to create a log file. It is created in the gem, and you can change the content for getting different results when output.

1) Download and install the programme (a ruby gem) that I created by doing:
	git clone git@github.com:aledelsur/amazon-logparser.git
2) Run the bundle install command.
3) Install redis-server according http://redis.io/topics/quickstart
4) Open a shell and run:
	 RM_CHILD=1 QUEUE=* rake resque:work
5) Open another shell and run:
	 rake resque:scheduler
6) Build the gem by doing:
	gem build parser.gemspec
7) Install the gem by doing:
	gem install ./parser-0.0.1.gem
8) Open a Ruby console by doing:
	irb
9) Require the class Parser by doing:
	require 'parser'
10) Initialize Parser by doing:
	parser = Parser.new
11) Run the method "start" of the class Parser with the parameters you want to evaluate in the output. For example:
	parser.start("/home/ale/proyectos/logParser/example/log.txt", "garak", "ale")
	
	- The first parameter is the the ubication where is the log file.	Here you must put the complete path.
	- The second parameter is the configurable name of the host which other hosts connect to it. So, if you give the host "garak", you will see in the output all the hosts that are connected to "garak".
	- The third parameter is the configurable name of the host which connects to other hosts. So, if you give the host "ale", you will see in the output all the hosts that "ale" is connected to.
12) To run the TESTS made with RSpec, just open a shell and put:
	rspec

### Assumptions ###

- I assume that each line has ever three words (a timestamp, a host, and another host) and two spaces among the three words.

- I assume that in the following explanation, the given (configurable) host is the third word and what I have to list is the second word: 
	"a list of hostnames connected to a given (configurable) host during the last hour."

	Example:
		1366815793 quark garak
		1366815811 lilac garak

		The given (configurable) host is "garak" and the listed hostnames will be "quark" and "lilac".


- I assume that in the following explanation, the given (configurable) host is the second word and what I have to list is the third word:
	"a list of hostnames received connections from a given (configurable) host during the last hour."

	The given (configurable) host is "quark" and the listed hostnames will be "garak" and "lilac"

	Example:
		1366815793 quark garak
		1366815795 quark lilac

- I assume that in the following explanation, I have to list the second word:
	"the hostname that generated most connections in the last hour."

- I assume that the hosts do not have spaces in the name.


### Info visited ###

Make your own gem
http://guides.rubygems.org/make-your-own-gem/#writing-tests

Resque Scheduler (for executing the rake task once an hour)
https://github.com/bvandenbos/resque-scheduler



