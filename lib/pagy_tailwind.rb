class Pagy
  module NumericHelpers
    def tailwind_series_nav(**)
      a_lambda = a_lambda(
        anchor_string: 'class="rounded-lg border border-gray-300 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"'
      )

      html =
        if previous
          previous_tag(a_lambda)
        else
          %(<a role="link" aria-disabled="true" aria-label="Previous" class="rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-300 cursor-not-allowed">←</a>)
        end

      series(**).each do |item|
        html << case item
                when Integer
                  a_lambda.call(item)
                when String
                  %(<a role="link" aria-disabled="true" aria-current="page" class="rounded-lg bg-gray-900 px-3 py-2 text-sm font-medium text-white">#{page_label(item)}</a>)
                when :gap
                  %(<span class="px-2 py-2 text-gray-500">…</span>)
                end
      end

       html <<
        if self.next
          next_tag(a_lambda)
        else
          %(<a role="link" aria-disabled="true" aria-label="Next" class="rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-300 cursor-not-allowed">→</a>)
        end

      %(<nav class="flex items-center justify-center gap-2" aria-label="Pages">#{html}</nav>).html_safe
    end
  end
end