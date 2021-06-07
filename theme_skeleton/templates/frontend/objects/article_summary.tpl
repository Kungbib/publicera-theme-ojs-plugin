{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $heading string HTML heading element, default: h2
 *}
{assign var=articlePath value=$article->getBestId()}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

{assign var=publication value=$article->getCurrentPublication()}
<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="file articleSummary-link">
<p class="pkp_screen_reader screen-reader-only">{$article->getLocalizedTitle()|strip_unsafe_html}{if $article->getLocalizedSubtitle()}: {$article->getLocalizedSubtitle()|escape}{/if}. {translate key="plugins.themes.publicera_theme.site.publishedIn"} {$journal->getLocalizedName()}, {translate key="issue.vol"} {$issue->getData('volume')}, {translate key="issue.no"} {$issue->getData('number')}, ({$issue->getData('year')}), {translate key="plugins.themes.publicera_theme.site.by"} {$article->getAuthorString()|escape}</p>
<div class="obj_article_summary articleSummary">
	{if $publication->getLocalizedData('coverImage')}
		<div class="cover articleSummary-cover">
				{assign var="coverImage" value=$article->getCurrentPublication()->getLocalizedData('coverImage')}
				<img
					src="{$article->getCurrentPublication()->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
					alt="{$coverImage.altText|escape|default:''}"
				/>
		</div>
	{else}
		<div class="cover articleSummary-cover is-placeholder" aria-hidden="true">
				<img src="{$imageAssetPath}/journal_default_cover.png" alt="{translate key="plugins.themes.publicera_theme.search.searchResults.coverImagePlaceholderAlt"}" />
		</div>
	{/if}
		<div class="articleSummary-details" aria-hidden="true">
			<div class="articleSummary-source">
				<span>
					{$journal->getLocalizedName()}
				</span>
				<span>
					{translate key="issue.vol"} {$issue->getData('volume')},
					{translate key="issue.no"} {$issue->getData('number')},
					({$issue->getData('year')})
				</span>
				{if $issue->getData('title')}
					<span>
						{$issue->getData('title')|join}
					</span>
				{/if}
				<!--
				{if $showDatePublished && $article->getDatePublished()}
					<span class="published">
						{$article->getDatePublished()|date_format:$dateFormatShort}
					</span>
				{/if}
				-->
			</div>

			<{$heading} class="title articleSummary-title">
					{$article->getLocalizedTitle()|strip_unsafe_html}
					{if $article->getLocalizedSubtitle()}
						<span class="subtitle">
							• {$article->getLocalizedSubtitle()|escape}
						</span>
					{/if}
			</{$heading}>

			<div class="articleSummary-author">
				{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}
				<div class="meta articleSummary-author">
					{if $showAuthor}
					<div class="authors">
						{$article->getAuthorString()|escape}
					</div>
					{/if}

					{* Page numbers for this article *}
					{if $article->getPages()}
						<div class="pages">
							{$article->getPages()|escape}
						</div>
					{/if}
				</div>
		</div>
	</div>
	{/if}

	{if !$hideGalleys}
		<ul class="galleys_links">
			{foreach from=$article->getGalleys() item=galley}
				{if $primaryGenreIds}
					{assign var="file" value=$galley->getFile()}
					{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
						{continue}
					{/if}
				{/if}
				<li>
					{assign var="hasArticleAccess" value=$hasAccess}
					{if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
						{assign var="hasArticleAccess" value=1}
					{/if}
					{include file="frontend/objects/galley_link.tpl" parent=$article labelledBy="article-{$article->getId()}" hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
				</li>
			{/foreach}
		</ul>
	{/if}

	{call_hook name="Templates::Issue::Issue::Article"}
</div>
</a>
