<?php

// Includes
include 'PubliceraThemeModifiers.inc.php';

/**
 * @class DefaultChildThemePlugin
 * @ingroup plugins_themes_default
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class PubliceraThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {
		$this->setParent('defaultthemeplugin');

		// Load primary stylesheet
		$this->addStyle('stylesheet', 'styles/theme.css');

		// Load Vendor JS
		$this->addScript('bootstrap', 'js/bootstrap.min.js');
		$this->addScript('masonry', 'js/masonry.pkgd.min.js');
		$this->addScript('isotope', 'js/isotope.min.js');

		// Load own JS
		$this->addScript('journal-list', 'js/journal-list.js');
		$this->addScript('about-collapse', 'js/about-collapse.js');

		// Image assets
		HookRegistry::register('TemplateManager::display', array($this, 'sitewideData'));

		// Load modifiers
		$this->loadModifiers();
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	public function getDisplayName() {
		return __('plugins.themes.publicera_theme.name');
	}

	public function sitewideData($hookName, $args) {
		$this->smarty = $args[0];
		$smarty = $args[0];

		$imagesAssetPath = $this->getRequest()->getBaseUrl() . DIRECTORY_SEPARATOR . $this->getTemplatePath() . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR;
		$smarty->assign('imageAssetPath', $imagesAssetPath);

		// Assign sorted journals to the template
		$smarty->assign('sortedJournals', $this->getJournalsByLatestIssue());
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	public function getDescription() {
		return __('plugins.themes.publicera_theme.description');
	}

	/**
	 * Load theme smarty modifiers
	 */
	public function loadModifiers() {
		// Retrieve the TemplateManager
		$smarty = TemplateManager::getManager($this->getRequest());

		// Create new instance of modifiers class
		$modifiers = new PubliceraThemeModifiers($smarty);

		// Register modifiers in smarty
		$modifiers->register('filter_ps_journal', array($modifiers, 'filter_ps_journal'));
		$modifiers->register('limitItems', array($modifiers, 'limitItems'));
		$modifiers->register('itemsWithIssue', array($modifiers, 'itemsWithIssue'));
	}

	/**
	 * Get journals sorted by latest published issue
	 */
	public function getJournalsByLatestIssue() {
		// Load the Journal DAO to fetch journals
		$journalDao = DAORegistry::getDAO('JournalDAO');
		$journals = $journalDao->getAll(true);  // Pass 'true' to only get enabled journals
		$sortedJournals = [];
		$currentLocale = AppLocale::getLocale();

		// Iterate over each journal
		while ($journal = $journals->next()) {
			$journalId = $journal->getId();

			// Debugging: Log the journal ID
			error_log("Processing journal ID: $journalId");

			// Fetch published issues for the journal
			$issueDao = DAORegistry::getDAO('IssueDAO');
			$issues = $issueDao->getPublishedIssues($journalId);  // Get the latest issue (limit 1)

			// Check if any issues are returned
			$latestIssue = $issues->next();
			if ($latestIssue) {
				error_log("Latest issue date for journal ID $journalId: " . $latestIssue->getDatePublished());

				$sortedJournals[] = [
					'journal' => $journal,
					'journalUrl' => "/" . $journal->getPath(),
					'journalThumbnail' => $journal->getLocalizedData('journalThumbnail'),
					'latestIssueDate' => $latestIssue->getDatePublished(),
					'latestIssueId' => $latestIssue->getId(),
					'latestIssueUrl' => "/" . $journal->getPath() . "/issue/view/" . $latestIssue->getId(),
					'coverImageUrl' => $latestIssue->getLocalizedCoverImageUrl(),
				];
			} else {
				error_log("No published issues for journal ID $journalId.");

				$sortedJournals[] = [
					'journal' => $journal,
					'journalUrl' => $journal->getPath(),
					'journalThumbnail' => $journal->getLocalizedData('journalThumbnail'),
					'latestIssueDate' => null,
					'latestIssueId' => null,
					'coverImageUrl' => null,
				];
			}
		}

		return $sortedJournals;
	}
}

?>
