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
