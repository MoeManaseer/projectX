module ExecuteHelper
  def execute (code,input)
    code = <<-Code
      begin
        #{code}
    rescue Exception => e
      puts ""
        puts e.class
        raise e
      end
     Code
    fileName = (0...20).map {(48+rand(10)).chr }.join
    codeFile = "./tmp/#{fileName}.rb"
    inputFile ="./tmp/#{fileName}.txt"
    File.write(codeFile,code)
    File.write(inputFile,input)
    str = "timeout 3s ruby #{codeFile} < #{inputFile}"
    submission = {:status => "", :output => ""}
    out = `#{str}`
    exit_code = $?
    `rm #{inputFile}`
    `rm #{codeFile}`
    if exit_code.exitstatus == 0
      submission[:status] = "success"
      submission[:output] = out
    elsif exit_code.exitstatus ==124
      submission[:status] = "Time Limit Exceeded"
    else
      state = ""
      if out ==""
        state = "Syntax Error"
      else
        error = out.split("\n").last
        error.split('').each do |chr|
          if /[[:upper:]]/.match(chr) and state!=""
            state+=" "
          end
          state+=chr
        end
      end
      submission[:status]=state
    end
    submission
  end
end
