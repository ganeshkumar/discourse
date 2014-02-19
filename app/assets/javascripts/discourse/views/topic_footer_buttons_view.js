/**
  This view is used for rendering the buttons at the footer of the topic

  @class TopicFooterButtonsView
  @extends Discourse.ContainerView
  @namespace Discourse
  @module Discourse
**/
Discourse.TopicFooterButtonsView = Discourse.ContainerView.extend({
  elementId: 'topic-footer-buttons',
  topicBinding: 'controller.content',

  init: function() {
    this._super();
    this.createButtons();
  },

  // Add the buttons below a topic
  createButtons: function() {
    var topic = this.get('topic');
    if (Discourse.User.current()) {
      if (!topic.get('isPrivateMessage')) {

        // We hide some controls from private messages
        this.attachViewClass(Discourse.StarButton);
        this.attachViewClass(Discourse.ShareButton);
        this.attachViewClass(Discourse.ClearPinButton);
      }
      this.attachViewClass(Discourse.ReplyButton);
      this.attachViewClass(Discourse.NotificationsButton);

      this.trigger('additionalButtons', this);
    } else {
      // If not logged in give them a login control
    }
  }
});


