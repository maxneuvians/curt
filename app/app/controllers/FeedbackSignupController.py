from masonite.views import View
from masonite.controllers import Controller
from masonite.request import Request



class FeedbackSignupController(Controller):
    def show(self, request: Request, view: View):
        service = request.input('service')
        return view.render(
            "feedback_signup",
            {"service": service},
        )
