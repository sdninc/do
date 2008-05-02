require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'logger'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'connection'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'transaction'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'command'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'result'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'reader'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'field'))
require File.expand_path(File.join(File.dirname(__FILE__), 'data_objects', 'quoting'))


module DataObjects
  class LengthMismatchError < StandardError; end
end

# class ConnectionFailed < StandardError; end
# 
# class ReaderClosed < StandardError; end
# 
# class ReaderError < StandardError; end
# 
# class QueryError < StandardError; end
# 
# class NoInsertError < StandardError; end
# 
# class LostConnectionError < StandardError; end
# 
# class UnknownError < StandardError; end
