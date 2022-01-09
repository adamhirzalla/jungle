module SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def sale
    # only interested in the first sale (considering we dont have conflicting sale periods)
    Sale.active.first
  end
end