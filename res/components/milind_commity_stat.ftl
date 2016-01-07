<div class="custom-community-stats-wrapper">
        <div class="stats-title">${text.format("custom.community-data")}</div>

        <div class="custom-community-stats-item custom-community-stats-members">
                <span class="custom-community-stats-count">
                        <#assign membersCount = (restadmin("/metrics/name/completed_registrations").value)!0 />
                        ${membersCount!0}
                </span>
                <span class="custom-community-stats-label">
                        ${text.format("custom.community.stats.members.label")}
                </span>
        </div>
        <div class="custom-community-stats-item custom-community-stats-online">
                <span class="custom-community-stats-count">
                        <#assign postsCount = (rest("/posts/count").value)!0 />
                        ${postsCount!0}
                </span>
                <span class="custom-community-stats-label">
                        ${text.format("custom.community.stats.posts.label")}
                </span>
        </div>
        <div class="custom-community-stats-item custom-community-stats-solutions">
                <span class="custom-community-stats-count">
                        <#assign solutionsCount = (rest("/solutions/count").value)!0 />
                        ${solutionsCount!0}
                </span>
                <span class="custom-community-stats-label">
                        <#if solutionsCount?number != 1>${text.format("custom.community.stats.solutions.label")}<#else>${text.format("custom.community.stats.solution.label")}</#if>
                </span>
        </div>
</div>