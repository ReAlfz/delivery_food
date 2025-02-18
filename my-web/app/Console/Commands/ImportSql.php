<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ImportSql extends Command
{



    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:import {file}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import a SQL file into the database';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $filePath = $this->argument('file');

        if (!File::exists($filePath)) {
            $this->error("File don't exists: $filePath");
            return;
        }

        $sql = File::get($filePath);

        DB::unprepared($sql);
        $this->info('Database Imported Successfuly');
    }
}
