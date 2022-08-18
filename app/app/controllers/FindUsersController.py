from masonite.views import View
from masonite.controllers import Controller


class FindUsersController(Controller):
    def show(self, view: View):
        return view.render(
            "find_users",
            {},
        )
