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
	$image = $projectController->getImageByProjectId($project->id);
	$projectsWithTechnologies[] = [
		'id' => $project->id,
		'name' => $project->name,
		'description' => $project->description,
		'technologies' => $technologies,
		'image' => $image['path']
	];
}

$developer = $projectController->getPrincipalDeveloper();
$developerArray = [];

foreach ($developer as $dev) {
	$education = $projectController->getEducationDeveloper($dev->id);
	$developerArray[] = [
		'id' => $dev->id,
		'github_user' => $dev->github_user,
		'description' => $dev->description,
		'city' => $dev->city,
		'emoji' => $dev->emoji,
		'education' => $education
	];
}

$devImage = $projectController->getImageByImageId(2);

error_reporting(E_ALL);
ini_set('display_errors', 'On');

echo $twig->render('index.html', [
	'dev_image' => $devImage,
	'website_title' => 'Proyectos',
	'projects' => $projectsWithTechnologies,
	'developer' => $developerArray,
]);
?>
