module ApplicationHelper
    def active_status(status)
        if status
            content_tag(:span, class: "text-success") do
            tag.i("", class: "bi bi-check-circle")
            end
        else
            content_tag(:span, class: "text-danger") do
            tag.i("", class: "bi bi-x-circle")
            end
        end
    end
end
