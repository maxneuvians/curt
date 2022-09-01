from masonite.views import View
from masonite.controllers import Controller


class SignUpController(Controller):
    def show(self, view: View):
        return view.render(
            "thank_you",
            {},
        )
