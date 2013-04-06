# Copy from bundler/spec/support/helpers.rb
module Spec
  module Helpers
    def reset!
      @in_p, @out_p, @err_p = nil, nil, nil
    end

    attr_reader :out, :err, :exitstatus

    def in_app_root(&blk)
      Dir.chdir(bundled_app, &blk)
    end

    def mami(cmd, options = {})
      mami_bin = File.expand_path('../../../bin/mami', __FILE__)
      options.merge!(my_command_bin: mami_bin)
      my_command(cmd, options)
    end

    def my_command(cmd, options = {})
      expect_err  = options.delete(:expect_err)
      exitstatus = options.delete(:exitstatus)
      my_command_bin = options.delete(:my_command_bin)
      options["no-color"] = true unless options.key?("no-color") || %w(exec conf).include?(cmd.to_s[0..3])

      requires = options.delete(:requires) || []
      requires_str = requires.map{|r| "-r#{r}"}.join(" ")

      env = (options.delete(:env) || {}).map{|k,v| "#{k}='#{v}' "}.join
      args = options.map do |k,v|
        v == true ? " --#{k}" : " --#{k} #{v}" if v
      end.join

      cmd = "#{env}#{Gem.ruby} -I#{lib} #{requires_str} #{my_command_bin} #{cmd}#{args}"

      if exitstatus
        sys_status(cmd)
      else
        sys_exec(cmd, expect_err){|i| yield i if block_given? }
      end
    end

    def sys_exec(cmd, expect_err = false)
      Open3.popen3(cmd.to_s) do |stdin, stdout, stderr|
        @in_p, @out_p, @err_p = stdin, stdout, stderr

        yield @in_p if block_given?
        @in_p.close

        @out = @out_p.read_available_bytes.strip
        @err = @err_p.read_available_bytes.strip
      end

      puts @err unless expect_err || @err.empty? || !$show_err
      @out
    end

    def sys_status(cmd)
      @err = nil
      @out = %x{#{cmd}}.strip
        @exitstatus = $?.exitstatus
    end
  end
end
