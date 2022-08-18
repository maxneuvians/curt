from masonite.views import View
from masonite.controllers import Controller


class HomeController(Controller):
    def show(self, view: View):
        return view.render(
            "home",
            {},
        )
