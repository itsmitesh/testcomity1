<@component id="common.widget.user-name" user="conv:${env.context.message.author.id}" />

<span class="custom-message-node Hydration-board">
  <a class="lia-link-navigation" id="" href="${env.context.message.board.webUi.url}">${env.context.message.board.title}</a>
</span>
${text.format("board.articleview.post-time.standardpost.format","${env.context.message.postDate?date}")}