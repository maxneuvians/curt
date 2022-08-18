from masonite.views import View
from masonite.controllers import Controller


class FindServicesController(Controller):
    def show(self, view: View):
        return view.render(
            "find_services",
            {},
        )
