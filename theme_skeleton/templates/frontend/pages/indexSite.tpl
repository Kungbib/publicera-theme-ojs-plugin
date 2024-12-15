{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

<div class="page_index_site">
	<div class="journals">
		<h2>
			{translate key="plugins.themes.publicera_theme.headers.latest"}
		</h2>

		<ul class="issues-list fadeable faded" id="issues-list">
			<li class="issue-sizer col-12 col-xxs-6 col-md-4 col-lg-3 col-xl-2"></li>

			{foreach from=$sortedJournals|itemsWithIssue|limitItems:5 item=journalData}
				{assign var="thumb" value=$journalData.journalThumbnail}
				{assign var="url" value=$journalData.latestIssueUrl}
				{assign var="coverImage" value=$journalData.coverImageUrl}
				{assign var="name" value=$journalData.journal->getLocalizedName()}
				{assign var="latestIssueDate" value=$journalData.latestIssueDate}
				{assign var="latestIssueId" value=$journalData.latestIssueId}
				{assign var="id" value=$journalData.journal->getId()}

				<li class="issue-container col-12 col-xxs-6 col-md-4 col-lg-3 col-2xl-2" data-date="{$latestIssueDate}">
					<div class="issue">
						<a href="{$url}" alt="{$name}">
							{if $coverImage}
								<div class="issue-thumb-container thumb ratio" style="--bs-aspect-ratio: 125%;">
									<img class="issue-thumb" src="{$coverImage}">
								</div>
							{elseif $thumb}
								<div class="issue-thumb-container thumb is-placeholder ratio" style="--bs-aspect-ratio: 125%;">
									<img class="journal-thumb" src="{$journalFilesPath}{$id}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}>
								</div>
							{else}
								<div class="issue-thumb-container thumb is-placeholder ratio" style="--bs-aspect-ratio: 125%;">
								</div>
							{/if}
						</a>

						<div class="issue-body">
							<h3 class="journal-title">
								<a href="{$url|escape}" rel="bookmark">
									{$name}
								</a>
							</h3>

							<div class="issue-meta">
								{if $journalData.latestIssueVolume}
									<span>
										VOL {$journalData.latestIssueVolume}
									</span>
								{/if}
								{if $journalData.latestIssueNumber}
									<span>
										NO {$journalData.latestIssueNumber}
									</span>
								{/if}
								{if $journalData.latestIssueYear}
									<span>
										({$journalData.latestIssueYear})
									</span>
								{/if}
							</div>
						</div>
					</div>
				</li>
			{/foreach}
		</ul>
	</div>

	<div class="journals">
		<div class="section-title">
			<h2>
				{translate key="plugins.themes.publicera_theme.headers.alljournals"}
			</h2>

			<div class="section-actions">
				{include file="frontend/objects/sort_select.tpl" id="journalSortSelector"}
			</div>
		</div>

		{if !$sortedJournals|@count}
			{translate key="site.noJournals"}
		{else}
			<ul class="journals-list fadeable faded" id="journals-list">
				<li class="journal-sizer col-12 col-xxs-6 col-md-4 col-lg-3 col-2xl-2"></li>

				{foreach from=$sortedJournals|filter_ps_journal item=journalData}
					{assign var="thumb" value=$journalData.journalThumbnail}
					{assign var="url" value=$journalData.journalUrl}
					{assign var="id" value=$journalData.journal->getId()}
					{assign var="name" value=$journalData.journal->getLocalizedName()}
					{assign var="latestIssueDate" value=$journalData.latestIssueDate}

					<li
						class="journal-container {if $thumb}has_thumb{/if} col-12 col-xxs-6 col-md-4 col-lg-3 col-2xl-2"
						data-id="{$id}"
						data-title="{$name|lowercase}"
						data-date="{$latestIssueDate}"
						tabIndex="-1"
					>
						<div class="journal">
							<a href="{$url|escape}" tabIndex="0">
								{if $thumb}
									<div class="journal-thumb-container thumb ratio" style="--bs-aspect-ratio: 50%;">
										<img class="journal-thumb" src="{$journalFilesPath}{$id}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}>
									</div>
								{else}
									<div class="journal-thumb-container thumb is-placeholder ratio" style="--bs-aspect-ratio: 50%;">
									</div>
								{/if}
							</a>

							<div class="journal-body body">
								<h3 class="journal-title">
									<a href="{$url|escape}" rel="bookmark">
										{$name}
									</a>
								</h3>

								<ul class="journal-links links">
									<li class="view">
										<i class="bi bi-book"></i>
										<a href="{url|escape journal=$url page="issue" op="current"}">
											{translate key="plugins.themes.publicera_theme.site.journalCurrent"}
										</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
				{/foreach}
			</ul>
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
