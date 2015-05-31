class Services::CliProgress

  LENGTH = 50
  attr_accessor :total

  def initialize(total)
    @total = total.to_f
  end

  def print_progress_info(completed)
    completed += 1 # yay, we work with array indexes...
    norm     = 1.0 / (total / LENGTH)
    progress = (completed * norm).ceil
    pending  = LENGTH - progress
    Kernel.print "[#{'=' * progress }#{' ' * ( pending )}] #{percentage(completed, total)}%\r"
  end
   
  def percentage(completed, total)
    ( ( completed / total.to_f ) * 100 ).round
  end

end
