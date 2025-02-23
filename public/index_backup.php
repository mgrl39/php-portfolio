<?php
require_once "../vendor/autoload.php";
require_once "../src/DatabaseController.php";
require_once "../src/ProjectController.php";

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader, [
	//'cache' => 'cache',
]);

$projectController = new ProjectController();

$projects = $projectController->getProjects();
$projectsWithTechnologies = [];

foreach ($projects as $project) {
	$technologies = $projectController->getTechnologiesByProject($project->id);
	$projectsWithTechnologies[] = [
		'id' => $project->id,
		'name' => $project->name,
		'description' => $project->description,
		'technologies' => $technologies
	];
}

$developer = $projectController->getPrincipalDeveloper();
$developerArray = [];

foreach ($developer as $dev) {
	$developerArray[] = [
		'id' => $dev->id,
		'github_user' => $dev->github_user,
		'description' => $dev->description,
		'city' => $dev->city,
		'emoji' => $dev->emoji
	];
}

error_reporting(E_ALL);
ini_set('display_errors', 'On');

echo $twig->render('index.html', [
	'website_title' => 'Proyectos',
	'projects' => $projectsWithTechnologies,
	'developer' => $developerArray,
]);
?>
