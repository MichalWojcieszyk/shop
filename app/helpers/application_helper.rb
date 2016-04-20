module ApplicationHelper
	def markdown(text)
		render_options = {
			filter_html: true,
			hard_wrap: true, 
			link_attributes: { rel: 'nofollow' }
		}
		renderer = Redcarpet::Render::HTML.new(render_options)

		extensions = {
			autolink: true,
			fenced_code_blocks: true,
			lex_spacing: true,
			no_intra_emphasis: true,
			strikethrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
	end

  def author
    unless product.user == current_user
      redirect_to category_product_url(category, product),
      flash: { error: 'You are not allowed to edit this product.' }
    end
  end
end
